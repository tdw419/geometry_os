; DESCRIPTION: Renders a cyan box of size 68x56 starting at (322, 166).
; PLAN: r0=322(x), r1=166(y), r2=68(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 166
LDI r2, 68
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
