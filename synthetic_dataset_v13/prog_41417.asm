; DESCRIPTION: Renders a cyan box of size 81x27 starting at (428, 215).
; PLAN: r0=428(x), r1=215(y), r2=81(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 215
LDI r2, 81
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
