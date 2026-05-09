; DESCRIPTION: Composite: Places a black circle of radius 49 at center (167, 177) then Places a cyan 45x21 rectangle at position (92, 129) then Draws a white line from (409, 168) to (60, 255).
; PLAN: r0=167(x), r1=177(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=129(y), r7=45(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x1), r11=168(y1), r12=60(x2), r13=255(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 177
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 129
LDI r7, 45
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 168
LDI r12, 60
LDI r13, 255
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
