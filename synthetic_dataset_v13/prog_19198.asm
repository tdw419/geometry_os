; DESCRIPTION: Renders a cyan box of size 71x82 starting at (240, 33).
; PLAN: r0=240(x), r1=33(y), r2=71(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 33
LDI r2, 71
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
