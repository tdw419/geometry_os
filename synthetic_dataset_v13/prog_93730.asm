; DESCRIPTION: Composite: Places a red dot at position (256, 143) then Places a magenta 44x32 rectangle at position (271, 42) then Draws a magenta line from (327, 204) to (192, 62).
; PLAN: r0=256(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=42(y), r7=44(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x1), r11=204(y1), r12=192(x2), r13=62(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 143
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 271
LDI r6, 42
LDI r7, 44
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 204
LDI r12, 192
LDI r13, 62
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
