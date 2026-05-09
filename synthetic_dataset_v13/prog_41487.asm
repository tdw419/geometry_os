; DESCRIPTION: Creates a purple rectangular region at (174, 129) spanning 120 by 97 pixels.
; PLAN: r0=174(x), r1=129(y), r2=120(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 129
LDI r2, 120
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
