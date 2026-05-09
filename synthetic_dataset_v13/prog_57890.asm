; DESCRIPTION: Renders a cyan box of size 66x27 starting at (142, 198).
; PLAN: r0=142(x), r1=198(y), r2=66(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 198
LDI r2, 66
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
