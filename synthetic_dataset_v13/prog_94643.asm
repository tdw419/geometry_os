; DESCRIPTION: Places a red 68x35 rectangle at position (190, 192).
; PLAN: r0=190(x), r1=192(y), r2=68(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 192
LDI r2, 68
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
