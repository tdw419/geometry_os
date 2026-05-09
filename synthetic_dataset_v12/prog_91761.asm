; DESCRIPTION: Places a red 119x47 rectangle at position (276, 192).
; PLAN: r0=276(x), r1=192(y), r2=119(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 192
LDI r2, 119
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
