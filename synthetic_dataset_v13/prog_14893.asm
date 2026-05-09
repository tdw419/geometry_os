; DESCRIPTION: Creates a cyan rectangular region at (183, 205) spanning 120 by 48 pixels.
; PLAN: r0=183(x), r1=205(y), r2=120(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 205
LDI r2, 120
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
