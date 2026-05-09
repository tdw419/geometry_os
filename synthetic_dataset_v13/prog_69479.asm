; DESCRIPTION: Creates a red rectangular region at (229, 160) spanning 112 by 16 pixels.
; PLAN: r0=229(x), r1=160(y), r2=112(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 160
LDI r2, 112
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
