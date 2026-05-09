; DESCRIPTION: Composite: Places a black 80x50 rectangle at position (426, 129) then Places a blue dot at position (386, 141).
; PLAN: r0=426(x), r1=129(y), r2=80(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=141(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 129
LDI r2, 80
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 141
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
