; DESCRIPTION: Creates a cyan rectangular region at (226, 120) spanning 68 by 63 pixels.
; PLAN: r0=226(x), r1=120(y), r2=68(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 120
LDI r2, 68
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
