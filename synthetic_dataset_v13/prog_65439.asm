; DESCRIPTION: Renders a cyan box of size 58x10 starting at (415, 76).
; PLAN: r0=415(x), r1=76(y), r2=58(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 76
LDI r2, 58
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
