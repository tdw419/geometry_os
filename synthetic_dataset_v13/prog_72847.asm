; DESCRIPTION: Renders a cyan box of size 115x115 starting at (203, 117).
; PLAN: r0=203(x), r1=117(y), r2=115(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 117
LDI r2, 115
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
