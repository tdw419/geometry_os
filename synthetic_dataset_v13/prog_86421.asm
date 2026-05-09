; DESCRIPTION: Composite: Places a blue 94x33 rectangle at position (53, 17) then Renders a cyan disk with center (387, 129) and radius 61 then Places a green dot at position (284, 43).
; PLAN: r0=53(x), r1=17(y), r2=94(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=129(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=43(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 17
LDI r2, 94
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 129
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 43
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
