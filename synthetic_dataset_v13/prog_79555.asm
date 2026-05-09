; DESCRIPTION: Renders a cyan box of size 65x82 starting at (77, 164).
; PLAN: r0=77(x), r1=164(y), r2=65(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 164
LDI r2, 65
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
