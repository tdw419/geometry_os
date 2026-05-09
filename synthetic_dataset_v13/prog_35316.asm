; DESCRIPTION: Places a red 112x109 rectangle at position (246, 77).
; PLAN: r0=246(x), r1=77(y), r2=112(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 77
LDI r2, 112
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
