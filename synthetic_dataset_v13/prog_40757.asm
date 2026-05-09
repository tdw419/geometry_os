; DESCRIPTION: Renders a cyan box of size 66x24 starting at (92, 195).
; PLAN: r0=92(x), r1=195(y), r2=66(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 195
LDI r2, 66
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
