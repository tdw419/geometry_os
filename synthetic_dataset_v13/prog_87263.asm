; DESCRIPTION: Renders a cyan box of size 55x95 starting at (181, 108).
; PLAN: r0=181(x), r1=108(y), r2=55(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 108
LDI r2, 55
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
