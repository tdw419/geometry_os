; DESCRIPTION: Renders a cyan box of size 116x17 starting at (374, 91).
; PLAN: r0=374(x), r1=91(y), r2=116(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 91
LDI r2, 116
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
