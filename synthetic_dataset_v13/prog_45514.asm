; DESCRIPTION: Creates a cyan rectangular region at (113, 106) spanning 87 by 63 pixels.
; PLAN: r0=113(x), r1=106(y), r2=87(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 106
LDI r2, 87
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
