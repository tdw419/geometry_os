; DESCRIPTION: Renders a cyan box of size 48x86 starting at (0, 51).
; PLAN: r0=0(x), r1=51(y), r2=48(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 51
LDI r2, 48
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
