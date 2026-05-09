; DESCRIPTION: Composite: Renders a black disk with center (80, 66) and radius 14 then Places a orange dot at position (164, 206) then Places a cyan 106x70 rectangle at position (393, 152).
; PLAN: r0=80(x), r1=66(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=206(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=393(x), r11=152(y), r12=106(width), r13=70(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 66
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 206
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 393
LDI r11, 152
LDI r12, 106
LDI r13, 70
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
