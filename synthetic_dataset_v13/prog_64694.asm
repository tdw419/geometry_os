; DESCRIPTION: Renders a cyan box of size 31x76 starting at (236, 131).
; PLAN: r0=236(x), r1=131(y), r2=31(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 131
LDI r2, 31
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
