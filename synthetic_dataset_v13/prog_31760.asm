; DESCRIPTION: Renders a cyan box of size 93x112 starting at (285, 44).
; PLAN: r0=285(x), r1=44(y), r2=93(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 44
LDI r2, 93
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
