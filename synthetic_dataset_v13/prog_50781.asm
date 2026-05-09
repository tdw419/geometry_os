; DESCRIPTION: Renders a cyan disk with center (298, 173) and radius 43.
; PLAN: r0=298(x), r1=173(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 173
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
