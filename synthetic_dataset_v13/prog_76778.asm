; DESCRIPTION: Creates a red rectangular region at (371, 229) spanning 50 by 24 pixels.
; PLAN: r0=371(x), r1=229(y), r2=50(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 229
LDI r2, 50
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
