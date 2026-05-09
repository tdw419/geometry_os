; DESCRIPTION: Renders a cyan box of size 55x55 starting at (275, 194).
; PLAN: r0=275(x), r1=194(y), r2=55(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 194
LDI r2, 55
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
