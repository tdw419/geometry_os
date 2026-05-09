; DESCRIPTION: Creates a red rectangular region at (89, 72) spanning 54 by 50 pixels.
; PLAN: r0=89(x), r1=72(y), r2=54(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 72
LDI r2, 54
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
