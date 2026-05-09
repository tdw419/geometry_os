; DESCRIPTION: Renders a cyan box of size 70x74 starting at (154, 120).
; PLAN: r0=154(x), r1=120(y), r2=70(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 120
LDI r2, 70
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
