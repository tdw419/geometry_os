; DESCRIPTION: Renders a cyan box of size 106x28 starting at (264, 87).
; PLAN: r0=264(x), r1=87(y), r2=106(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 87
LDI r2, 106
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
