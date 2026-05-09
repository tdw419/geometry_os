; DESCRIPTION: Renders a white box of size 37x16 starting at (178, 190).
; PLAN: r0=178(x), r1=190(y), r2=37(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 190
LDI r2, 37
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
