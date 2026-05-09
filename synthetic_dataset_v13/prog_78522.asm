; DESCRIPTION: Renders a white box of size 34x64 starting at (221, 178).
; PLAN: r0=221(x), r1=178(y), r2=34(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 178
LDI r2, 34
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
