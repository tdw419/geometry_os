; DESCRIPTION: Renders a cyan box of size 114x90 starting at (322, 114).
; PLAN: r0=322(x), r1=114(y), r2=114(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 114
LDI r2, 114
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
