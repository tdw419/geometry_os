; DESCRIPTION: Renders a cyan box of size 13x116 starting at (165, 108).
; PLAN: r0=165(x), r1=108(y), r2=13(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 108
LDI r2, 13
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
