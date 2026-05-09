; DESCRIPTION: Renders a green box of size 27x27 starting at (256, 131).
; PLAN: r0=256(x), r1=131(y), r2=27(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 131
LDI r2, 27
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
