; DESCRIPTION: Creates a orange rectangular region at (215, 231) spanning 30 by 20 pixels.
; PLAN: r0=215(x), r1=231(y), r2=30(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 231
LDI r2, 30
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
