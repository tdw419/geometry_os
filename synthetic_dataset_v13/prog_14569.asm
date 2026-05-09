; DESCRIPTION: Renders a cyan box of size 72x99 starting at (171, 45).
; PLAN: r0=171(x), r1=45(y), r2=72(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 45
LDI r2, 72
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
