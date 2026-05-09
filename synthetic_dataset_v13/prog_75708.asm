; DESCRIPTION: Creates a red rectangular region at (448, 9) spanning 42 by 90 pixels.
; PLAN: r0=448(x), r1=9(y), r2=42(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 9
LDI r2, 42
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
