; DESCRIPTION: Renders a cyan box of size 28x81 starting at (287, 124).
; PLAN: r0=287(x), r1=124(y), r2=28(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 124
LDI r2, 28
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
