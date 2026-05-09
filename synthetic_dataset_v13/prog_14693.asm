; DESCRIPTION: Creates a cyan rectangular region at (413, 120) spanning 54 by 72 pixels.
; PLAN: r0=413(x), r1=120(y), r2=54(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 120
LDI r2, 54
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
