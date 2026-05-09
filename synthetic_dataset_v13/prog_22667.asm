; DESCRIPTION: Creates a cyan rectangular region at (413, 226) spanning 63 by 30 pixels.
; PLAN: r0=413(x), r1=226(y), r2=63(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 226
LDI r2, 63
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
