; DESCRIPTION: Renders a white box of size 85x64 starting at (368, 47).
; PLAN: r0=368(x), r1=47(y), r2=85(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 47
LDI r2, 85
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
