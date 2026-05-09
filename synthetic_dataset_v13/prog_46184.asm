; DESCRIPTION: Composite: Creates a magenta rectangular region at (415, 70) spanning 96 by 95 pixels then Renders a cyan line between points (150, 167) and (134, 219).
; PLAN: r0=415(x), r1=70(y), r2=96(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=167(y1), r7=134(x2), r8=219(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 70
LDI r2, 96
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 167
LDI r7, 134
LDI r8, 219
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
