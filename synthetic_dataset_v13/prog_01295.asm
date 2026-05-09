; DESCRIPTION: Composite: Places a green 46x47 rectangle at position (61, 188) then Renders a green disk with center (372, 191) and radius 35 then Places a red dot at position (503, 47).
; PLAN: r0=61(x), r1=188(y), r2=46(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=191(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=503(x), r11=47(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 188
LDI r2, 46
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 191
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 503
LDI r11, 47
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
