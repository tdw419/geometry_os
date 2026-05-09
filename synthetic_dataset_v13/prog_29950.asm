; DESCRIPTION: Renders a cyan box of size 67x115 starting at (142, 87).
; PLAN: r0=142(x), r1=87(y), r2=67(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 87
LDI r2, 67
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
