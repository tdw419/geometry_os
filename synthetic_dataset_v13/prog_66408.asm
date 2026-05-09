; DESCRIPTION: Renders a cyan box of size 55x120 starting at (360, 40).
; PLAN: r0=360(x), r1=40(y), r2=55(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 40
LDI r2, 55
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
