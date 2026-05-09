; DESCRIPTION: Composite: Draws a red line from (154, 24) to (379, 53) then Places a magenta 47x60 rectangle at position (269, 74).
; PLAN: r0=154(x1), r1=24(y1), r2=379(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=74(y), r7=47(width), r8=60(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 24
LDI r2, 379
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 74
LDI r7, 47
LDI r8, 60
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
