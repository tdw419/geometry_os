; DESCRIPTION: Renders a cyan box of size 68x100 starting at (256, 91).
; PLAN: r0=256(x), r1=91(y), r2=68(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 91
LDI r2, 68
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
