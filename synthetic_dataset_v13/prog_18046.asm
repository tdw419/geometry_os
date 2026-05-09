; DESCRIPTION: Renders a cyan box of size 68x40 starting at (172, 124).
; PLAN: r0=172(x), r1=124(y), r2=68(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 124
LDI r2, 68
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
