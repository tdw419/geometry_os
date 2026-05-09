; DESCRIPTION: Composite: Places a yellow 27x111 rectangle at position (303, 19) then Places a purple dot at position (142, 152).
; PLAN: r0=303(x), r1=19(y), r2=27(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=152(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 19
LDI r2, 27
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 152
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
