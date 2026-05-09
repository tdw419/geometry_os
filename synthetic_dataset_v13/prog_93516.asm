; DESCRIPTION: Composite: Places a black 83x76 rectangle at position (121, 71) then Renders a cyan line between points (59, 138) and (401, 218) then Places a magenta circle of radius 29 at center (128, 221).
; PLAN: r0=121(x), r1=71(y), r2=83(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x1), r6=138(y1), r7=401(x2), r8=218(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=221(y), r12=29(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 71
LDI r2, 83
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 138
LDI r7, 401
LDI r8, 218
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 221
LDI r12, 29
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
