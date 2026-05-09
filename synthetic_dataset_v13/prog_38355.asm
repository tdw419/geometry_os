; DESCRIPTION: Creates a cyan rectangular region at (281, 106) spanning 61 by 112 pixels.
; PLAN: r0=281(x), r1=106(y), r2=61(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 106
LDI r2, 61
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
