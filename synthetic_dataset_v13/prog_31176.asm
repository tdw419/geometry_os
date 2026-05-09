; DESCRIPTION: Renders a cyan box of size 76x91 starting at (320, 96).
; PLAN: r0=320(x), r1=96(y), r2=76(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 96
LDI r2, 76
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
