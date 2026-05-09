; DESCRIPTION: Composite: Places a purple 42x67 rectangle at position (210, 15) then Draws a magenta line from (12, 220) to (299, 1).
; PLAN: r0=210(x), r1=15(y), r2=42(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=220(y1), r7=299(x2), r8=1(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 15
LDI r2, 42
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 220
LDI r7, 299
LDI r8, 1
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
