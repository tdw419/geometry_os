; DESCRIPTION: Places a yellow 28x120 rectangle at position (86, 71).
; PLAN: r0=86(x), r1=71(y), r2=28(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 71
LDI r2, 28
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
